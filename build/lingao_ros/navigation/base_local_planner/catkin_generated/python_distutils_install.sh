#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/pp/lingao_ws/src/lingao_ros/navigation/base_local_planner"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/pp/lingao_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/pp/lingao_ws/install/lib/python2.7/dist-packages:/home/pp/lingao_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/pp/lingao_ws/build" \
    "/usr/bin/python2" \
    "/home/pp/lingao_ws/src/lingao_ros/navigation/base_local_planner/setup.py" \
    egg_info --egg-base /home/pp/lingao_ws/build/lingao_ros/navigation/base_local_planner \
    build --build-base "/home/pp/lingao_ws/build/lingao_ros/navigation/base_local_planner" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/pp/lingao_ws/install" --install-scripts="/home/pp/lingao_ws/install/bin"
