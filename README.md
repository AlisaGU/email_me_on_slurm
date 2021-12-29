# email_me_on_slurm
This script is developed to be reminded if slurm jobs are submitted and Finished

Before using this script, you should **replace xxx@email.com with your email address**.

email_me has at least two parameters. The last one describes subjects in your email and the remaining parameters are slurm job id.

# EXAMPLE
```
email_me 1 2 3 "test" &
```
After job 1 2 and 3 are submitted, you will receive a email reminding you that your interested jobs have been submitted.

After job 1 2 and 3 are Finished(COMPLETED or FAIL), you will receive the second email about these jobs' status.
