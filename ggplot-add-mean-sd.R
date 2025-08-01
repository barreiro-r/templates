# Add this to ggplot to add mean and standard deviation as points and error bars

# your ggplot +
stat_summary(fun = mean, geom = "point", size = 2) +
stat_summary(
    fun.data = 'mean_sdl',
    fun.args = list(mult = 1),
    geom = "errorbar",
    width = 0.15)