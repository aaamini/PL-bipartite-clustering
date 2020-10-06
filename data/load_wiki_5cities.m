function [A,l1,l2,X_1,X_2] = load_wiki_5cities()

A = mmread('data/cities/adj5.mm');

%%
l2c = importdata('data/cities/ip_country.csv');
l1c = importdata('data/cities/city_country.csv');
countries = unique(l1c);

l1 = zeros(size(l1c));
l2 = zeros(size(l2c));

for k = 1:5
    l1(strcmpi(l1c, countries(k))) = k;
    l2(strcmpi(l2c, countries(k))) = k;
end

X_1 = dlmread('data/cities/city_lat_long.csv',',',1,0);
X_2 = dlmread('data/cities/ip_lat_long.csv',',',1,0);