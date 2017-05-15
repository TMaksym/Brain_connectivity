  function [Vals, p] = permut2(A,B, N)
%    Inputs:   A      ,input vector A
%              B      ,input vector B (can be of different size)
%              N      ,number of permutations

%    Outputs:  Vals   ,output vector of surrogate values
%              p      ,p value computed as 1 - as 1 - the fraction of permutation surrogate values smaller than the actual unpermuted difference of the means.

%---------testing parameters----------------------
% A=[5 -10 5 5  4 8 9 2 11 2 16 2 7 -4 3 7 15 33 31];    %----Input array_# 1: Array A-----%
% B=[1 15 -23 2 -6 9 1 3 -5 12 -4 -6 22 -15 -3];         %----Input array_# 1: Array B-----%
%N=10;                                                %----Number of premutations ----%
%-------------------------------------------------
 
%--------------------Case 1: Size of array A less or equal to the size of array B --------%    
if size(A) <= size(B)                      
   for i=1:N                               %-----Number of permutations
       Shuf_num_A(i) = randi(numel(A));    %-----Number of elements to be shuffled between arrays
       Y = randsample(A,Shuf_num_A(i));    %-----Select subsample of size 'Shuf_num_A' from array A

       [~,j]= find(ismember(A,Y));         %-----Find indices j (positions) of subsample elemetns Y in array A, including repetitions
       b=A(j);                             %-----Find all the elemnts in array A with indices j
       a_replica=A;
       a_replica(j)=[];               %-----Create copy of array A and remove all the values with indices j
       u=unique(Y);                   %-----Find all the unique values in subsample Y
       n=histc(Y,u);                  %-----Find number of repetitions for each unique value in subsample Y
       u1=unique(b);                  %-----Find all the unique values in array b
       n1=histc(b,u1);                %-----Find the number of repetitions for each unique value in array b
       n2=n1-n;                       %----Vector, which defines the number of repeated values that have to remain in initial array A
       u3 = repelem(u, n2);           %----Create elements to be added to initial array A
       a1=[a_replica u3];             %----Modified array A, which keeps the repeated values (if there were selected in subsample Y)

       Y1 = randsample(B,Shuf_num_A(i));   %-----Select subsample of size 'Shuf_num_A' from array B
       
       [~,j1]= find(ismember(B,Y1));       %-----Find indices j1 (positions) of subsample elemetns Y in array A, including repetitions
       b1=B(j1);                           %-----Find all the elemnts in array B with indices j1
       b_replica=B;
       b_replica(j1)=[];              %-----Create copy of array B and remove all the values with indices j1
       v=unique(Y1);                  %-----Find all the unique values in subsample Y1
       m=histc(Y1,v);                 %-----Find the number of repetitions for each unique value in subsample Y1
       v1=unique(b1);                 %-----Find all the unique values in array b1
       m1=histc(b1,v1);               %-----Find the number of repetitions for each unique value in array b1
       m2=m1-m;                       %-----Vector, which defines the number of repeated values that have to remain in initial array B
       v3 = repelem(v, m2);           %-----Create elements to be added to initial array B
       a2=[b_replica v3];             %----Modified array B, which keeps the repeated values (if there were selected in subsample Y1)
 
       permute_a=cat(2,a1,Y1);        %----Array A, which contains the elements of array B
       permute_b=cat(2,a2,Y);         %----Array B, which contains the elements of array A

       Vals(i)=mean(permute_a) -mean(permute_b);   %----Compute the mean difference between two arrays
      
       mu1=mean(A)-mean(B);                        %----Compute the unpermuted difference of the means of two arrays
      
       k = size(find(Vals < mu1),2);          %------Find all the elements in a vector of permuted values 
                                              %      less then the actual mean 'mu1'
       p=1-k/size((Vals),2);                  %------p-value calculated as a fraction 1 - the fraction of permutation surrogate 
                                              %      values smaller than 
                                              %     the actual unpermuted difference of means
 
 hist(Vals) ; grid on                         %------Plot distribution of the surrogates (histogram)--------%
 hold on 
 h1=plot([mu1,mu1],ylim,'r','LineWidth',2);   %------Plot actual unpermuted difference of means--------%

 hold off
 legend([h1],{'Actual mean'});                %------Add figure legend to plot--------%    
      
 end      
      
else 
 %--------------------Case 2: Size of array A bigger than the size of array B --------%   
       for i=1:N                           %-----Number of permutations
       Shuf_num_B(i) = randi(numel(B));    %-----Number of elements to be shuffled between arrays
       Y = randsample(A,Shuf_num_B(i));    %-----Select subsample of size 'Shuf_num_B' from array A
       
       [~,j]= find(ismember(A,Y));         %-----Find indices j (positions) of subsample elemetns Y in array A, including repetitions
       b=A(j);                             %-----Find all the elemnts in array A with indices j
       
       a_replica=A;
       a_replica(j)=[];               %-----Create copy of array A and remove all the values with indices j
       u=unique(Y);                   %-----Find all the unique values in subsample Y
       n=histc(Y,u);                   %-----Find number of repetitions for each unique value in subsample Y
       u1=unique(b);                  %-----Find all the unique values in array b
       n1=histc(b,u1);                 %-----Find the number of repetitions for each unique value in array b
       n2=n1-n;                       %----Vector, which defines the number of repeated values that have to remain in initial array A
       u3 = repelem(u, n2);           %----Create elements to be added to initial array A
       a1=[a_replica u3];             %----Modified array A, which keeps the repeated values (if there were selected in subsample Y)
     
       Y1 = randsample(B,Shuf_num_B(i));    %-----Select subsample of size Shuf_num_B from array B
       
       [~,j1]= find(ismember(B,Y1));   %-----Find indices j1 (positions) of subsample elemetns Y in array A, including repetitions
       b1=B(j1);                       %-----Find all the elemnts in array B with indices j1
       b_replica=B;
       b_replica(j1)=[];               %-----Create copy of array B and remove all the values with indices j1
       v=unique(Y1);                   %-----Find all the unique values in subsample Y1
       m=histc(Y1,v);                  %-----Find the number of repetitions for each unique value in subsample Y1
       v1=unique(b1);                  %-----Find all the unique values in array b1
       m1=histc(b1,v1);                %-----Find the number of repetitions for each unique value in array b1
       m2=m1-m;                        %-----Vector, which defines the number of repeated values that have to remain in initial array B
       v3 = repelem(v, m2);            %-----Create elements to be added to initial array B
       a2=[b_replica v3];              %----Modified array B, which keeps the repeated values (if there were selected in subsample Y1)
  
       permute_a=cat(2,a1,Y1);         %----Array A, which contains the elements of array B
       permute_b=cat(2,a2,Y);          %----Array B, which contains the elements of array A

       Vals(i)=mean(permute_a) -mean(permute_b);   %----Compute the mean difference between two arrays
      
       mu1=mean(A)-mean(B);                        %----Compute the unpermuted difference of the means of two arrays
      
       k = size(find(Vals < mu1),2);          %------Find all the elements in a vector of permuted values 
                                              %      less then the actual mean 'mu1'
       p=1-k/size((Vals),2);                  %------p-value calculated as a fraction 1 - the fraction of permutation surrogate 
                                              %      values smaller than the actual unpermuted mean

 hist(Vals) ; grid on                         %------Plot distribution of the surrogates (histogram)--------%
 hold on 
 h1=plot([mu1,mu1],ylim,'r','LineWidth',2);   %------Plot actual unpermuted difference of means--------%
 hold off
 legend([h1],{'Actual mean'});              %------Add figure legend to plot--------%
      
      
       end 
 end
end


