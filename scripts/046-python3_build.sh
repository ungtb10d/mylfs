    _pkgname="Python"
    _pkgver="3.6.4"
    _complete="${PWD}/LOGS/${FUNCNAME}.completed"
    _logfile="${PWD}/LOGS/${FUNCNAME}.log"
    [ -e ${_complete} ] && { msg "${FUNCNAME}: SKIPPING";return 0; } || msg "${FUNCNAME}: ${_pkgname} ${_pkgver}: Building"
    > ${_logfile}
    build " Clean build directory" 'rm -rf BUILD/*' ${_logfile}
    build " Change directory: BUILD" "pushd BUILD" ${_logfile}
    unpack "${PWD}" "${_pkgname}-${_pkgver}"
    build " Change directory: ${_pkgname}-${_pkgver}" "pushd ${_pkgname}-${_pkgver}" ${_logfile}

    build " Create work directory" "install -vdm 755 ../build" ${_logfile}
    build " Change directory: ../build" "pushd ../build" ${_logfile}
    build "+ ../${_pkgname}-${_pkgver}/configure --prefix=/usr --enable-shared --with-system-expat --with-system-ffi --with-ensurepip=yes" "../${_pkgname}-${_pkgver}/configure --prefix=/usr --enable-shared --with-system-expat --with-system-ffi --with-ensurepip=yes" ${_logfile}
    build "+ make" "make" ${_logfile}

    build "+ make install" "make install" ${_logfile}
    build "+ " "" ${_logfile}
    build "+ chmod -v 755 /usr/lib/libpython3.6m.so" "chmod -v 755 /usr/lib/libpython3.6m.so" ${_logfile}
    build "+ chmod -v 755 /usr/lib/libpython3.so" "chmod -v 755 /usr/lib/libpython3.so" ${_logfile}
    build " Restore directory" "popd " /dev/null
    build " Restore directory" "popd " /dev/null
    build " Restore directory" "popd " /dev/null
    >  ${_complete}
    return 0
