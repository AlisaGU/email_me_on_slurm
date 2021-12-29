# email_me_on_slurm
This script is developed to remind you when slurm jobs are submitted and Finished.

Before using this script, you should **replace xxx@email.com with your email address**.

email_me has at least two parameters. The last one describes subjects in your email and the remaining parameters are slurm job id.

# EXAMPLE
```
email_me 1 2 3 "test" &
```
When job 1 2 and 3 are submitted successfully (this is RUNNING), you will receive a email reminding you that these jobs have been submitted.

When job 1 2 and 3 are Finished(COMPLETED or FAILED OR CANCELED), you will receive another email about these jobs' status.

Please feel free to contact me if you have any suggestion!
