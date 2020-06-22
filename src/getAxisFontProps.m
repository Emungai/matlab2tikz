function [m2t, fopts] = getAxisFontProps(m2t, handle)
fopts = {'font' ''};
if strcmp(handle.FontWeight,'bold')
    fopts{2} = [fopts{2} '\bfseries'];
end
if strcmp(handle.FontAngle,'italic')
    fopts{2} = [fopts{2} '\itshape'];
end
switch handle.FontUnits
    case {'points'}
        mul = 1;
    case {'inches'}
        mul = 72.27;
    case {'centimeters'}
        mul = 28.45275590551181;
    otherwise
        error('matlab2tikz:getAxisFontProps','Unsupported axis units.')
end
fsize_str = sprintf('\\fontsize{%f}{%f}\\selectfont',...
    get(gca,'FontSize')*[1 1.2]*mul);
fopts{2} = [fopts{2} fsize_str];
end