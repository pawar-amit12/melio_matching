Welcome to Melio Matching project!

### Using the starter project

Try running the following commands to run project:
- dbt run

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


For DBT Fargate implementation I have added docker file and other dependencies under docker folder.
To run below commands you need to install `aws cli` on machine and create the `aws profile` on your machine.
### DBT - Fargate implementation steps
- Create an docker image with all the dependencies to run dbt project, clone the project repo with commands to  execute the project.To create docker image on local machine run below command.
    docker build -t melio-matching .
- Create an ECR repository.
    aws ecr create-repository --repository-name melio-matching-dbt --region us-east-1
- Tag docker image to ecr repository
    docker tag melio-matching 253753547356.dkr.ecr.us-east-1.amazonaws.com/melio-matching-dbt
- Login to ECR repository to push the docker image
    aws ecr get-login-password | docker login --username AWS --password-stdin 253753547356.dkr.ecr.us-east-1.amazonaws.com/melio-matching-dbt
- Push the docker image to ECR repository
    docker push 253753547356.dkr.ecr.us-east-1.amazonaws.com/melio-matching-dbt
- Create an Fargate Cluster on ECS
- Create an Task and map the ECR image to the task.
- Run Task.