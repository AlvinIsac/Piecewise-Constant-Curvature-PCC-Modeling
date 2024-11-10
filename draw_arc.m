
function draw_arc(x,color)
    plot3(x(:,1),x(:,2),x(:,3),color,'LineWidth',2);
    scatter3(x(1,1),x(1,2),x(1,3),'k','Filled');
    scatter3(x(end,1),x(end,2),x(end,3),'k','Filled');
end