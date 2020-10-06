addpath('common')
addpath('PL')
addpath('data')

%% CS author-paper data
load('data/cs_12345.mat')
% load('data/cs_345.mat')
% load('data/cs_45.mat')
z = l2; %% only one side has true labels
spy(A)
K = 5;
L = 5;

%% BIO author-paper data
% load('data/bio_neuro_biomed.mat')
% z = l2; %% only one size has true labels
% spy(A)
% K = 3;
% L = 3;

%% Wikipedia cities data
% [A,l1,l2,X_1,X_2] = load_wiki_5cities();
% y = l1; z = l2; K=5; L=5;

%% Apply spectral clustering (SC)

[ yt_sc, zt_sc ] = biSpecClust3(A, ... 
    [K L], ... % number of communities of the two sides
    'matched', false, ... % whether to find matched clusters (min([K L]) matched clusters will be returned)
    'normalize', true, ... % whether to noramlize rows of the singular vector matrix
    'type','u', ... % try 'us' as well
    'perturb', true, ... % whether to use perturbation
    'pert_geom', true, ... % geometric or arithmatic scaling for perturbation
    'tau', 1, ... % value of perturbation
    'kmeans_rep', 100); 

%% Alt: Apply SC with Data-driven Regularization
%
% [ yt_sc, zt_sc ] = biSpecClustDR(A, ... 
%      K, L, ... % number of communities of the two sides
%     'normalize', true, ... % whether to noramlize rows of the singular vector matrix
%     'type','US', ... % try 'U' as well
%     'RegConst', 1, ... % value of perturbation
%     'kmeans_rep', 100); 

%% Apply PL
[n,m] = size(A);
% yt_init = (generate_random_labels(n,K));
% zt_init = (generate_random_labels(m,L));

% Use the result of spectral clustering as initial labels
yt_init = label_vec2mat(yt_sc);
zt_init = label_vec2mat(zt_sc);

% Pseudo-lielihood iterations 
[yt, zt] = PLEM( A, yt_init, zt_init, ...
    'inner_hard', true, ...
    'outer_hard', true, ...
    'inner_loop', true, ...
    'prior', false, ...
    'new_y', false, ...
    'verb', 1, ...
    'tol_inner', 1e-6, ...
    'tol_outer', 1e-6, ...
    'cpl', true); % whether use CPL or PL, i.e. mixture of mult. or mixture of Pois.

% compute NMI w.r.t. to the true labels
fprintf('----\nNMIs\nSC = %3.3f\nPL = %3.3f\n', compute_mutual_info(zt_sc, z), compute_mutual_info(zt, z))

%%
% Z = label_vec2mat(z);
% Zt = label_vec2mat(zt_sc);
% Z' * Z
% Zt' * Zt