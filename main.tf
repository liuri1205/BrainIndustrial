provider "alicloud" {
  region = "cn-beijing"
}

resource "alicloud_brain_industrial_pid_organization" "example" {
  pid_organization_name = "tf-testAcc"
}

resource "alicloud_brain_industrial_pid_project" "example" {
  pid_organization_id = alicloud_brain_industrial_pid_organization.example.id
  pid_project_name    = "tf-testAcc"
}

resource "alicloud_brain_industrial_pid_loop" "example" {
  pid_loop_configuration = "{\"baseParam\":{\"forwardController\":false,\"integral\":false,\"kd\":{\"tagValue\":\"20\"},\"kp\":{},\"op\":\"PIDBenchmark.FOPDT_OP\",\"opParam\":{\"increment\":{\"max\":10},\"operate\":{\"max\":115,\"min\":-15},\"range\":{\"max\":115,\"min\":-15},\"trend\":0},\"openLoopTime\":150,\"pv\":\"PIDBenchmark.FOPDT_PV\",\"pvRange\":{\"max\":100,\"min\":0},\"sampleTime\":5,\"sp\":\"PIDBenchmark.FOPDT_SP\",\"spOperate\":{\"max\":100,\"min\":0},\"splitRangeControl\":false,\"suitCtrlTime\":100,\"td\":{},\"ti\":{}},\"identParam\":{\"delay\":10,\"modelType\":3},\"resetParam\":{\"ctrlMode\":0,\"ctrlStuc\":1}}"
  pid_loop_dcs_type      = "standard"
  pid_loop_is_crucial    = true
  pid_loop_name          = "tf-testAcc"
  pid_loop_type          = "0"
  pid_project_id         = alicloud_brain_industrial_pid_project.example.id
}