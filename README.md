# Check-Resources-In-AWS
This is a Repository that contains script to check resources present in your account. 

### Only to be used in AWS CLOUD

#### This is a Shell Script, that can be used to find out the resources present in all the regions. 

It sometimes becomes tricky to find out the resources present in any given region and we need to go through each and every region tofind out the resources present there and this may be a very lengthy process. You can make use of this script to find out the resources present in any region.

1. Download or [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository#cloning-a-repository) the script from github repository.

    ```sh
    git clone https://github.com/mrsatya21/Check-Resources-In-AWS.git
    ```
2. Go to the directory `Check-Resources-In-AWS` where you have downloaded or cloned the repository. 

    ```sh
    cd Check-Resources-In-AWS
    ```

3. Change the permission - 

    ```sh
    chmod +x checkResources.sh 
    ```

4. Run the shell script - 

    ```sh
    ./checkResources.sh
    ```

NOTE - It is necessary to [install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html#cli-configure-files-methods) AWS [CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) before using this script.

