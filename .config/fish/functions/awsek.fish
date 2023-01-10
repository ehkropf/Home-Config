function awsek
    set instance_id "i-04ccfb5625bfdc6af"
    switch $argv[1]
        case status
            aws ec2 describe-instance-status --instance-ids $instance_id
        case start
            aws ec2 start-instances --instance-ids $instance_id
        case stop
            aws ec2 stop-instances --instance-ids $instance_id
        case '*'
            echo "Unknown command: " $argv[1]
            echo -e "\nawsdev <command>"
            echo -e "\nCommands:"
            echo -e "\tstatus\n\tstart\n\tstop"
    end
end
