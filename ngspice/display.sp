.title Display script 
.control
setplot tran1

* Time series analysis
plot TP1 TP2 TP3 TP4 TP5 TP6 TP7 xlimit $start_tm $end_tm

linearize
set specwindow=blackman

* Spectral analysis functions
spec $start_freq $end_freq $freq_step v(tp1) v(tp3)
meas sp max_freq_fpo max_at v(tp1)
echo FPO fundamental: {$&max_freq_fpo} Hz

meas sp max_freq_vpo max_at v(tp3)
echo VPO fundamental: {$&max_freq_vpo} Hz

plot tp1 tp3 xlimit $start_freq $end_freq

setplot tran2

* Simple FFT
fft v(tp1) v(tp3)
plot v(tp1) v(tp3) xlimit $start_freq $end_freq
meas sp max_freq_fpo_fft max_at v(tp1) from=1
echo FPO fundamental (fft calculation): {$&max_freq_fpo_fft} Hz

meas sp max_freq_vpo_fft max_at v(tp3)  from=1
echo VPO fundamental (fft calculation): {$&max_freq_vpo_fft} Hz

*set probe_point=a
*** gnuplot stuff ***
*plot b xlimit $start_tm $end_tm
*gnuplot newplot a b f xlimit $start_tm $end_tm
* fft V(A)
* gnuplot FFT mag(V(A))

*gnuplot FPO $probe_point xlimit $start_tm $end_tm 
* Max, min, average
*meas tran ymax max $probe_point from=$start_tm to=$end_tm
*meas tran ymin min $probe_point from=$start_tm to=$end_tm
*meas tran ypp pp $probe_point from=$start_tm to=$end_tm
*meas tran yavg avg $probe_point from=$start_tm to=$end_tm
*set yavg_={$&yavg}(0)

* Frequency and Period
*meas tran tdiff
*+trig $probe_point val=$yavg_ rise=1 td=$start_tm;trig at=$start_tm
*+targ $probe_point val=$yavg_ rise=2 td=$start_tm;targ at=$end_tm 

*let period_us={$&tdiff}*1000000
*let freq_khz=1/{$&tdiff}/1000

*echo
*echo YMax={$&ymax}V, YMin={$&ymin}V, YAvg={$&yavg}V, YVpp={$&ypp}V
*echo Period={$&period_us}us, freq={$&freq_khz}KHz
*echo


* See section 22.6, "Data evaluation with Gnuplot"

.endc
