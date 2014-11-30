importCombined();
plot(TopN, TopicModellingOnly);
ty = ylabel('F measure');
set(ty, 'FontSize', 20);
tx = xlabel('Top n ');
set(tx, 'FontSize', 20);
tt = title('F measure vs top n for topic modeling only');
set(tt, 'FontSize', 20);

figure;
plot(TopN, TopicModellingMetadata);
ty = ylabel('F measure');
set(ty, 'FontSize', 20);
tx = xlabel('Top n ');
set(tx, 'FontSize', 20);
tt = title('F measure vs top n for topic modeling and Metadata');
set(tt, 'FontSize', 20);

importTFIDF();
figure;
plot(N, FMeasure, 'g');
ty = ylabel('F measure');
set(ty, 'FontSize', 20);
tx = xlabel('Top n ');
set(tx, 'FontSize', 20);
tt = title('F measure vs top n for TFIDF only');
set(tt, 'FontSize', 20);

importHarmonyResults();
figure;
plot(n, F1score, 'm');
ty = ylabel('F measure');
set(ty, 'FontSize', 20);
tx = xlabel('Top n ');
set(tx, 'FontSize', 20);
tt = title('F measure vs top n for Harmony');
set(tt, 'FontSize', 20);

figure;
plot(TopN, TopicModellingOnly);
ty = ylabel('F measure');
set(ty, 'FontSize', 20);
tx = xlabel('Top n ');
set(tx, 'FontSize', 20);
tt = title('Comparison between different techniques');
set(tt, 'FontSize', 20);
hold on;
plot(TopN, TopicModellingMetadata, 'r');
hold on;
plot(N, FMeasure, 'g');
hold on;
plot(n, F1score, 'm');
legend('TopicModelling Only', 'TopicModelling and Metadata', 'TFIDF', 'Harmony');

