
function draw_frame(nx,ny,nz,x,scaling_factor)
    nx = nx*scaling_factor;
    ny = ny*scaling_factor;
    nz = nz*scaling_factor;
    quiver3(x(1),x(2),x(3),nx(1),nx(2),nx(3),'r');
    hold on
    quiver3(x(1),x(2),x(3),ny(1),ny(2),ny(3),'g');
    quiver3(x(1),x(2),x(3),nz(1),nz(2),nz(3),'b');
end