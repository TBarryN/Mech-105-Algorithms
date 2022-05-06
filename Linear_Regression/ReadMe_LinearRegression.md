% Thomas Nickerson 

%linearRegression Computes the linear regression of a data set

%   Compute the linear regression based on inputs:

[sortedY, sortOrder] = sort(y);

sortedX = x(sortOrder);

n = length(x);

step = true(1,n);

if length(x)~=length(y)

    error ('error incoming,you failed')
    
end

Q1 = quantile(sortedY,0.25)

Q3 = quantile(sortedY,0.75)

q1 = floor((1*n+1)/4);

q3 = floor((3*n+3)/4);

iqr = Q3-Q1

for i=1:n

    if 1.5*iqr + Q3 < sortedY(i) && -1.5*iqr + Q1 < sortedY(i);
    
        % iqr*1.5 +Q3 < sortedY(i) && (iqr*-1.5)+iqr < sortedY(i)
        
    step(i)=0
    
    end
    
    if sortedY(i) == 0 
    
    step(i) = 0
    
    end
    
end

fY = sortedY(step);

fX = sortedX(step);

newn = length(fY);

olden = length(fX);

ply = sum(fY);

plx = sum(fX);

Ybar = (sum(fY)./newn);

Xbar = (sum(fX)./newn);

sqx = sum(fX.^2);

sqy = sum(fY.^2);

sumo_x = (sum(fX)).^2

simp = sum(fX.*fY);

slope = ((newn*simp)-(plx.*ply))./((newn*sqx)-(sumo_x));

intercept = Ybar-(slope*Xbar);

regress = slope*fX + intercept

Rsquared = 1-(sum((fY-regress).^2)./(sum((fY-Ybar).^2)));

