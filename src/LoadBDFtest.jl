using Telepathy
using GLMakie

using Anomaly

raw = load_data("data/P17_HN1.bdf")

# plot(raw)
# lines(raw.data[:, 1]) - single channel (note column-major system)
# lines!(raw.data[:, 2]) - adds another channel to the previous plot (note Julia "!" convention)

#filtered = filter_data(raw, high_)

# Note that Telepathy is currently adjusted to work with Biosemi BDF files and
# their internal structure (event channels etc.).
# Telepathy.jl/src/channels/locations contain layout files

find_events!(raw) # load the events into the Raw
plot_events(raw) # sanity check
#set_layout!(raw, :biosemi64) # set the electrode layout. For the 
set_layout!(raw, :biosemi128) # 

plot_layout(raw) # terminal plot of the electrode layout

filter_data!(raw, lowPass=0.1, highPass=40) # low/high pass filtering

# plot_raw.jl - contains keyboard shortcuts/hotkeys

raw.bads = peak2peak(raw.data[:, 1]) # set bad channels