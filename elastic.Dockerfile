FROM docker.elastic.co/elasticsearch/elasticsearch:8.12.0
RUN elasticsearch-plugin install analysis-nori
