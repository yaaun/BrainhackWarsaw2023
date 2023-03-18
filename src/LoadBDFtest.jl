using Telepathy
using GLMakie

raw = load_data("data/P17_HN1.bdf")

# plot(raw)
# lines(raw.data[:, 1]) - single channel (note column-major system)
# lines!(raw.data[:, 2]) - adds another channel to the previous plot (note Julia "!" convention)

filtered = filter_data(raw, high_)