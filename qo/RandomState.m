%densnk(2,2)

function rho=RandomState(N,K)
  rho=zeros(N);
  wec1=randn(N*K,1);
  wec2=randn(N*K,1);
  wec=wec1+wec2*i;
  ss=sum(wec1.*wec1)+sum(wec2.*wec2);
  %% renormalization of random Gaussian vector
  va = wec/sqrt(ss);
  %% vector v (1,KN) -> matrix x (N,K)
  vb = reshape(va,[N,K]);
  rho = vb*vb';
end
