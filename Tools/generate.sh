swift run swift-openapi-generator generate \
    --mode types --mode client \
    --output-directory ../OpenFoodFactsService/Sources/ \
    --config ../Sources/OpenFoodFactsSDKOpenAPIClient/openapi-generator-config.yaml \
    ../Sources/OpenFoodFactsSDKOpenAPIClient/openapi.yaml
