####################################
### Simple bash script for deploying the helm chart
####################################
#!/bin/bash
helm install -f custom_values_files/custom_redis-cart_values.yaml redis-cart charts/redis_chart/
helm install -f custom_values_files/custom_emailservice_values.yaml emailservice charts/depi_project_chart/
helm install -f custom_values_files/custom_cartservice_values.yaml cartservice charts/depi_project_chart/
helm install -f custom_values_files/custom_currencyservice_values.yaml currencyservice charts/depi_project_chart/
helm install -f custom_values_files/custom_paymentservice_values.yaml paymentservice charts/depi_project_chart/
helm install -f custom_values_files/custom_recomservice_values.yaml recomservice charts/depi_project_chart/
helm install -f custom_values_files/custom_productcatalogservice_values.yaml productcatalogservice charts/depi_project_chart/
helm install -f custom_values_files/custom_shippingservice_values.yaml shippingservice charts/depi_project_chart/
helm install -f custom_values_files/custom_adservice_values.yaml adservice charts/depi_project_chart/
helm install -f custom_values_files/custom_checkoutservice_values.yaml checkoutservice charts/depi_project_chart/
helm install -f custom_values_files/custom_frontend_values.yaml frontend charts/depi_project_chart/