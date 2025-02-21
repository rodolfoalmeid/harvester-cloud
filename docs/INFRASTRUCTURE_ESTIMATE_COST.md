## GCP Cost Analysis

The following information shows the infrastructure cost estimation to deploy Harvester on GCP using all options available in the terraform script.
Please note that all estimated costs shown are generic estimates only which are not 100% accurate as the total price will be different for each scenario and GCP project.

### Cost Table

| Type   | Region      | Mode      | Disks | Disk Type      | Disk Size    | Required Instance     | Overestimated Cost ($) |
|--------|-------------|-----------|------|----------------|--------------|-----------------------|------------------------|
| Small  | europe-west8 | Spot      | 1    | pd-ssd         | 350 GB       | n2-standard-16        | 250                    |
| Small  | europe-west8 | Spot      | 3    | pd-ssd         | 350 GB       | n2-standard-32        | 400                    |
| Small  | europe-west8 | Regular   | 1    | pd-ssd         | 350 GB       | n2-standard-16        | 800                    |
| Small  | europe-west8 | Regular   | 3    | pd-ssd         | 350 GB       | n2-standard-32        | 1500                   |
| Medium | europe-west8 | Spot      | 1    | pd-ssd         | 350 GB       | n2-standard-32        | 400                    |
| Medium | europe-west8 | Spot      | 3    | pd-ssd         | 350 GB       | n2-standard-64        | 600                    |
| Medium | europe-west8 | Regular   | 1    | pd-ssd         | 350 GB       | n2-standard-32        | 1500                   |
| Medium | europe-west8 | Regular   | 3    | pd-ssd         | 350 GB       | n2-standard-64        | 2800                   |

### Azure Instance Prices

| Instance       | Regular Price per Month | Spot Price per Month | REGION       |
|----------------|-------------------------|----------------------|--------------|
| n2-standard-16 | 750                     | 200                  | europe-west8 |
| n2-standard-32 | 1400                    | 315                  | europe-west8 |
| n2-standard-64 | 2730                    | 520                  | europe-west8 |

### GCP Disk Cost

| Disk Type | Price per 350 GB per Month | REGION        |
|-----------|-------------------------|---------------|
| pd-ssd    | 17                      | europe-west8  |

### GCP Sources of Information

- [GCP Pricing calculator](https://cloud.google.com/calculator)

## Azure Cost Analysis

The following information shows the infrastructure cost estimation to deploy Harvester on Azure using all options available in the terraform script.
Please note that all estimated costs shown are generic estimates only which are not 100% accurate as the total price will be different for each scenario and Subscription account.

### Cost Table

| Type   | Region       | Mode   | Disks | Disk Type         | Disk Size | Required Instance         | Overestimated Cost ($) |
|--------|-------------|--------|--------|-------------------|-------------|---------------------------|----------------------|
| Small  | Europe West | Spot   | 1      | PREMIUM SSD LRS  | 350 GB      | Standard_D16as_v5        | 200                  |
| Small  | Europe West | Spot   | 3      | PREMIUM SSD LRS  | 350 GB      | Standard_D32as_v5        | 450                  |
| Small  | Europe West | Regular| 1      | PREMIUM SSD LRS  | 350 GB      | Standard_D16as_v5        | 750                  |
| Small  | Europe West | Regular| 3      | PREMIUM SSD LRS  | 350 GB      | Standard_D32as_v5        | 1500                 |
| Medium | Europe West | Spot   | 1      | PREMIUM SSD LRS  | 350 GB      | Standard_D32as_v5        | 300                  |
| Medium | Europe West | Spot   | 3      | PREMIUM SSD LRS  | 350 GB      | Standard_D64as_v5        | 650                  |
| Medium | Europe West | Regular| 1      | PREMIUM SSD LRS  | 350 GB      | Standard_D32as_v5        | 1350                 |
| Medium | Europe West | Regular| 3      | PREMIUM SSD LRS  | 350 GB      | Standard_D64as_v5        | 3000                 |

### Azure Instance Prices

| Instance           | Regular Price per Month | Spot Price per Month | REGION     |
|---------------------|-------------------------|-------------|------------|
| Standard_D16as_v5  | 607                     | 85          | Europe West |
| Standard_D32as_v5  | 1215                    | 170         | Europe West |
| Standard_D64as_v5  | 2430                    | 340         | Europe West |

### Azure Disk Cost

| Disk Type         | Price per 350 GB per Month | REGION     |
|---------------------|------------------------|------------|
| PREMIUM SSD LRS    | 73                     | Europe West |

### Azure Sources of Information

- [Azure Spot Pricing](https://azure.microsoft.com/en-us/pricing/spot-advisor/#pricing)
- [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/?service=spot-advisor)
