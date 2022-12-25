FROM node:18-alpine

ENV HOST="https://app.xardy.com" \
    SCOPES="write_products,read_discounts, read_customers, write_customers, read_discounts, write_discounts, read_script_tags, write_script_tags, read_themes, write_themes" \
    SHOPIFY_API_KEY="91059e32eda8f0877fbb7061230e81eb" \
    SHOPIFY_API_SECRET="7c2ce68249300acef57cdb916901e8f2" \
    PORT=4501
EXPOSE 4501
WORKDIR /app
COPY web .
RUN npm install
RUN cd frontend && npm install && npm run build
CMD ["npm", "run", "serve"]
