.title Control script

* READ THIS!! *
* https://ngspice.sourceforge.io/ngspice-control-language-tutorial.html

.control
pre_set ngbehavior=ltps
set start_tm=3m
set end_tm=3.01m
set time_step=0.1u

set start_freq=200k
set end_freq=400k
set freq_step=500

tran $time_step $end_tm
setplot
.endc
