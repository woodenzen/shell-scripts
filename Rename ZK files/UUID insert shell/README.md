---
UUID:      ›[[202204082026]] 
cdate:     04-08-2022 08:26 PM
tags:      #proofing
---
# Insert-Title Shell Script

[Field Report #5: How I Prepare Reading and Processing Effective Notetaking by Fiona McPherson — Zettelkasten Forum](https://forum.zettelkasten.de/discussion/2203/field-report-5-how-i-prepare-reading-and-processing-effective-notetaking-by-fiona-mcpherson#latest)

Click on this link to download the actual script - [insert-title.sh](https://www.dropbox.com/s/4ib7a3h8ha1npnh/insert-title.sh?dl=0)
<file:///Users/will/Dropbox/Git/insert-UUID/insert-title.sh>

Download this to your Downloads directory. Open Terminal and `cd ~/Downloads`
Be sure we are where we think we are
`ls-al insert-title.sh`

Make executable
`chmod u+x insert-title.sh`

Execute script from Downloads directory
`./insert-title.sh`

You'll get a greeting message, answer `y`.
Feed it the path to your zetterlkasten directory.
Here is an example.
`/Users/will/Dropbox/Projects/testzks/test`
Note that there is no trailing `/`

If you answer incorrectly, nothing bad should happen, you'll just have to start again executing `./insert-title.sh`

It will take a minute or two to process 1400 files.

The console may over and over slowly produce errors that look like 

```
awk: illegal byte sequence �
input record number 1, file 
source line number 1
```

Don't worry. Each one is a place where a "special character" is placed in the filename. The process will continue but the particular file with the special character will have the "File Name: " blank. If it is only 12 notes as in my case this might be a non-issue but if they are easily identified then we can fix them and rerun the script.

To check the output of the script use the "Switch Archives..."

In the end you'll end up your original ZK untouched, in it will be a folder called backup next to your media/ folder, and a folder called modified. By comparing the backup with the original we can determine those notes that failed (which is different from the special character condition). Once satisfied you can move your current ZK and move and rename the modified folder pointing The Archive at it.

There is should be no problem rerunning this script.

./Screen Shot 2022-04-08 at 9.23.21 PM.png