export getSensTMatVecbatch

function getSensTMatVecbatch(v::Vector,srcind::Vector,recind::Vector,pFor::EikonalInvParam)

   # extract pointers
    Q     = pFor.Sources
    P     = pFor.Receivers
    nsrc = size(Q,2); nrec = size(P,2)
	
    n = length(srcind);
    nt = size(Q,1);

    # allocate space for result
    JTv  = zeros(nt)
	JTvi = zeros(nt)
	pEiks = pFor.eikonalParams;
	
	#if length(v)!=nsrc*nrec
	#	warn("wrong size of vector v in EikonalInv::getSensTMatVec.jl");
	#end
	
    for i=1:n
		tdum = zeros(nrec);
		tdum[recind[i]] = 1.0;
		#print(v[(srcind[i]-1)*nrec + recind[i]]*tdum);
		t = P*(v[(srcind[i]-1)*nrec + recind[i]]*tdum); #P*v[(recind[i]-1)*nrec + 1 : recind[i]*nrec];
		getSensTMatVecEik(t,JTvi,pEiks[srcind[i]]);
        JTv += JTvi;
    end
    #print(size(JTv));
    return JTv;
end
