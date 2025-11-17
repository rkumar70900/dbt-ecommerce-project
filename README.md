# dbt E-commerce Analytics Project

A comprehensive dbt project for e-commerce data analytics, featuring data transformation, visualization, and quality testing for an e-commerce platform.

## 📊 Project Overview

This dbt project transforms raw e-commerce data into actionable business insights through a structured data pipeline that includes:
- Data type normalization and cleaning
- Business intelligence visualizations
- Data quality testing and validation
- Automated data snapshots for historical tracking

## 🏗️ Project Structure

```
dbt-ecommerce-project/
├── models/
│   ├── needed_cols/          # Essential column extraction from source tables
│   ├── data_types/          # Data type normalization and formatting
│   ├── charts/              # Business intelligence and analytics models
│   └── raw_charts/          # Raw analytical queries
├── tests/                   # Data quality and validation tests
├── snapshots/               # Historical data snapshots
├── seeds/                   # Static reference data
├── analyses/                # Ad-hoc analysis queries
└── macros/                  # Reusable dbt macros
```

## 📋 Data Sources

The project connects to an `ecommerce_database` with the following tables:
- **orders** - Customer order information and status tracking
- **customers** - Customer demographic and profile data
- **order_items** - Detailed order line items
- **payments** - Payment transaction records
- **sellers** - Seller/marketplace information
- **reviews** - Customer reviews and ratings
- **products** - Product catalog and categorization
- **run_log** - Automated execution tracking

## 🔄 Data Pipeline Stages

### 1. Column Extraction (`needed_cols/`)
- Extracts essential columns from source tables
- Creates clean, focused views for downstream processing
- Includes: `nc_customers`, `nc_orders`, `nc_orderitems`, `nc_payments`, `nc_products`, `nc_reviews`, `nc_sellers`

### 2. Data Type Normalization (`data_types/`)
- Converts string dates to proper datetime formats
- Standardizes data types across all tables
- Materialized as tables for performance:
  - `dt_orders` - Order timestamp normalization
  - `dt_payments` - Payment data formatting
  - `dt_orderitems` - Order item data structuring
  - `dt_reviews` - Review data processing
  - `dt_products` - Product catalog standardization

### 3. Business Intelligence (`charts/`)
Key analytical models for business insights:
- **Order Analytics**: Monthly order trends, delivery status analysis
- **Product Performance**: Category sales analysis, top/lowest performing categories
- **Customer Experience**: Average delivery times, customer review patterns
- **Quality Assurance**: Fake review detection and analysis

### 4. Data Quality Testing (`tests/`)
Comprehensive test suite covering:
- **Data Completeness**: Missing order detection, review completeness checks
- **Data Validity**: Date validation, timestamp consistency
- **Business Logic**: Payment total validation, order status constraints
- **Referential Integrity**: Customer-order relationships

## 🚀 Getting Started

### Prerequisites
- dbt Core installed
- Configured database connection (see `dbt_project.yml`)
- Source database: `ecommerce_database`

### Installation
```bash
# Clone the repository
git clone <repository-url>
cd dbt-ecommerce-project

# Install dependencies
dbt deps

# Run the project
dbt run
```

### Usage Commands
```bash
# Execute all models
dbt run

# Run specific model groups
dbt run --select path:models/data_types
dbt run --select path:models/charts

# Run data quality tests
dbt test

# Generate documentation
dbt docs generate
dbt docs serve
```

## 📈 Key Features

### Automated Execution Tracking
- Custom run logging via `on-run-start` and `on-run-end` hooks
- Tracks job execution status and timestamps in `run_log` table

### Materialization Strategy
- **Views**: For `needed_cols` (lightweight, always up-to-date)
- **Tables**: For `data_types` and `charts` (performance-optimized for analytics)

### Reference Data
- Product category translations (Portuguese to English)
- Static seed data for consistent categorization

### Historical Snapshots
- Order snapshots for tracking changes over time
- Product catalog snapshots for inventory management

## 🧪 Testing Strategy

The project includes comprehensive data quality tests:

### Data Integrity Tests
- Unique constraints on primary keys
- Not-null validations on critical fields
- Referential integrity between related tables

### Business Logic Tests
- Order status validation against accepted values
- Date sequence validation (purchase → delivery)
- Payment amount reconciliation

### Data Quality Tests
- Review completeness checks
- Fake review detection patterns
- Missing data identification

## 📊 Analytics Capabilities

### Order Analytics
- Monthly order volume trends
- Delivery status distribution
- Average delivery times by carrier

### Product Analytics
- Category performance analysis
- Sales trends over time
- Product catalog insights

### Customer Analytics
- Review behavior patterns
- Delivery experience metrics
- Customer satisfaction indicators

## 🔧 Configuration

### Database Profile
Configure your database connection in `profiles.yml`:
```yaml
dbt_ecommerce_project:
  target: dev
  outputs:
    dev:
      type: <database_type>
      host: <hostname>
      user: <username>
      password: <password>
      port: <port>
      database: ecommerce_database
      schema: ecommerce_database
```

### Customization
- Add new analytical models in `models/charts/`
- Extend data quality tests in `tests/`
- Modify source configurations in `models/sources.yml`

## 🤝 Contributing

1. Follow dbt best practices for model development
2. Add appropriate tests for new models
3. Update documentation for new features
4. Ensure all tests pass before submitting

## 📚 Resources

- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Community Discourse](https://discourse.getdbt.com/)
- [dbt Slack Community](https://community.getdbt.com/)
- [dbt Blog](https://blog.getdbt.com/)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
