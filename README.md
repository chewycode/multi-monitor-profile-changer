# multi-monitor-profile-changer
This is my bash script to change my monitor setup that is connected to my desktop.  I mainly use it to change from my 3 desk monitors to my 4k tv when I'm ready to lay in bed.
<br>
Usage:<br>

<code>$ sh mon.sh 1st 2nd(optional)</code>

The 1st arguemnt is required.  It has to be 4 digits consisting of 1's and 0's.  1 means ON and 0 means OFF.<br>
Example:<code>$ sh mon.sh 1110</code><br>
This will make the left 3 monitors turn on while turning off the 4th monitor.
<br><br>
The second argument is optional.  In order to specify this argument you must turn on 4th monitor (the last digit needs to be 1) The second argument can only be one of the following...<br>
<ul>
  <li>4k: makes the resolution of TV 4k.  Without this it defaults to 1080p</li>
  <li>mirror1: TV mirrors monitor 1</li>
  <li>mirror2: TV mirrors monitor 2</li>
  <li>mirror3: TV mirrors monitor 3</li>
</ul>
Example:<code>$ sh mon.sh 1111 mirror3</code><br>
This will make the TV mirror monitor 3
<br><br>
The best part is you can ssh into your desktop from your phone or laptop to change you monitor setup.
