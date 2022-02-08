# Create memberships for the distinct set of all team members who aren't admins.

locals {
  non_admin_members = setsubtract(
    setunion(
      local.apex_team,
      local.apriltag_team,
      local.async_web_server_cpp_team,
      local.autoware_team,
      local.behaviortree_team,
      local.bno055_team,
      local.connextdds_team,
      local.control_box_rst_team,
      local.control_team,
      local.cyberbotics_team,
      local.cyclonedds_team,
      local.diagnostics_team,
      local.fastcdr_team,
      local.fmi_team,
      local.gazebo_team,
      local.geographic_info_team,
      local.grbl_team,
      local.gscam_team,
      local.gurumdds_team,
      local.ifm3d_team,
      local.lgsvl_team,
      local.libg2o_team,
      local.locator_ros_bridge_team,
      local.message_filters_team,
      local.micro_ros_diagnostics_team,
      local.micro_ros_msgs_team,
      local.microstrain_team,
      local.mrpt2_team,
      local.navigation_team,
      local.nmea_team,
      local.nodl_team,
      local.object_analytics_team,
      local.octomap_team,
      local.ouster_drivers_team,
      local.perception_team,
      local.rclc_team,
      local.rcpputils_team,
      local.realsense_team,
      local.rmf_team,
      local.roboception_team,
      local.robotwebtools_team,
      local.ros_canopen_team,
      local.ros_team,
      local.rosauth_team,
      local.rosbag2_team,
      local.rqt_team,
      local.security_wg_team,
      local.swri_team,
      local.system_modes_team,
      local.tier4_team,
      local.tooling_wg_team,
      local.tracing_team,
      local.transport_drivers_team,
      local.ublox_team,
      local.udp_msgs_team,
      local.urdf_tutorial_team,
      local.urg_team,
      local.v4l2_camera_team,
      local.velodyne_simulator_team,
      local.velodyne_team,
      local.vision_msgs_team,
      local.xacro_team,
    ),
    local.ros_admins
  )
}

resource "github_membership" "members" {
  for_each = local.non_admin_members

  username = each.value
  role = "member"
}

