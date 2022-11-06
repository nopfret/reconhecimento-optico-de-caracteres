function f_plot_boundingbox(umin, vmin, umax, vmax)

hold on;
plot([umin umax], [vmin vmin], 'g');
plot([umin umax], [vmax vmax], 'g');
plot([umin umin], [vmin vmax], 'g');
plot([umax umax], [vmin vmax], 'g');


