resource "aws_autoscaling_group" "prj-ec2_autoscalling_group" {

	name = "EC2.ASG | ${var.project_ecosystem} | ${var.project_webapplication} | ${var.project_environment} | NO Advance Metrics"
	#(Optional) The name of the auto scale group. By default generated by terraform.

	min_size = "${var.prj-ec2_asg_minsize}"
	#(Required) The minimum size of the auto scale group. (See also Waiting for Capacity below.)
	
	max_size = "${var.prj-ec2_asg_maxsize}"
	#(Required) The maximum size of the auto scale group.

	desired_capacity = "${var.prj-ec2_asg_desirecap}"
	#(Optional) The number of Amazon EC2 instances that should be running in the group. (See also Waiting for Capacity below.)
	
	availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
	#(Optional) A list of AZs to launch resources in. Required only if you do not specify any vpc_zone_identifier
	
	launch_configuration = "${aws_launch_configuration.prj-ec2_launch_conf.name}"
	#(Required) The name of the launch configuration to use.
	
	health_check_grace_period = "300"
	#(Optional, Default: 300) Time (in seconds) after instance comes into service before checking health.
	
	health_check_type = "EC2"
	#(Optional) "EC2" or "ELB". Controls how health checking is done.
		
	#force_delete
	#(Optional) Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling.
	
	#load_balancers
	#(Optional) A list of load balancer names to add to the autoscaling group names.
	
	#vpc_zone_identifier
	#(Optional) A list of subnet IDs to launch resources in.
	
	#target_group_arns
	#(Optional) A list of aws_target_group ARNs, for use with Application Load Balancing
	
	termination_policies = ["OldestInstance"]
	#(Optional) A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default.
	
	#placement_group
	#(Optional) The name of the placement group into which you'll launch your instances, if any.
	
	#metrics_granularity
	#(Optional) The granularity to associate with the metrics to collect. The only valid value is 1Minute. Default is 1Minute.
	
	#enabled_metrics
	#(Optional) A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances.
	
	#wait_for_capacity_timeout
	#(Default: "10m") A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to "0" causes Terraform to skip all Capacity Waiting behavior.
	
	#min_elb_capacity
	#(Optional) Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. (See also Waiting for Capacity below.)
	
	#wait_for_elb_capacity
	#(Optional) Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. (Takes precedence over min_elb_capacity behavior.) (See also Waiting for Capacity below.)
	
	#protect_from_scale_in
	#(Optional) Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events.

	#tags
	#(Optional) A list of tag blocks. Tags documented below.
	
	tag {
		key = "Name"
		value = "${var.project_name}"
		propagate_at_launch = true
	}
	tag {
		key = "EcoSystem"
		value = "${var.project_ecosystem}"
		propagate_at_launch = true
	}
	tag {
		key = "WebApplication"
		value = "${var.project_webapplication}"
		propagate_at_launch = true
	}
	tag {
		key = "Interface"
		value = "${var.project_interface}"
		propagate_at_launch = true
	}
	tag {
		key = "Environment"
		value = "${var.project_environment}"
		propagate_at_launch = true
	}
	tag {
		key = "ServiceStatus"
		value = "in-Deployment"
		propagate_at_launch = true
	}	
	
}