function RunMagicSquares

	measure="neg";
  error_name="dep";
	
	for ga=[1:1]#3
		for gb=[1:1]#3
			out=abs(RunMagicSquaresGame([ga,gb],10,measure(1:3)));
			name=sprintf("ms_%s_game_%d_%d_error_%s",measure,ga,gb, error_name);
			printf(name);
			printf("\n");
			fflush(1);
			save ("-text", name, "out");
			#mesh(out);
			plot(out(:,1),out(:,2));
		end
	end
	
end
