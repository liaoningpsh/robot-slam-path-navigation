////////////////////////////////////////////////////////////////
建图
source ./devel/setup.bash
roslaunch lingao_bringup lidar_robot_tf.launch 

source ./devel/setup.bash
roslaunch lingao_bringup gmapping.launch 

/////////////////////////////////////////////////////////////
保存地图
rosrun map_server map_saver -f text

//////////////////////////////////////////////////////////////
路径规划导航
roslaunch lingao_bringup lidar_robot_tf.launch

roslaunch lingao_bringup lujing.launch


///////////////////////////////////////////////////////

配置环境
    安装 gmapping 包(用于构建地图):sudo apt install ros-melodic-gmapping

    安装地图服务包(用于保存与读取地图):sudo apt install ros-melodic-map-server

    安装 navigation 包(用于定位以及路径规划):sudo apt install ros-melodic-navigation


