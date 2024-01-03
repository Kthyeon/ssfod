# **[NeurIPS2023] A Framework for Semi-Supervised Federated Object Detection** 🚌 

## 💡 **Introduction**
This official repository contains the implementation and dataset setup for the research paper **"Navigating Data Heterogeneity in Federated Learning: A Semi-Supervised Federated Object Detection"**, presented at NeurIPS 2023 [[Link](https://openreview.net/forum?id=2D7ou48q0E)], by **[Taehyeon Kim](https://taehyeon.oopy.io/)**, Eric Lin, Junu Lee, Christian Lau, and Vaikkunth Mugunthan. 

🎤 **TL;DR**: We introduce a groundbreaking Semi-Supervised Federated Object Detection (SSFOD) framework where the server has labeled data and all clients have only unlabeled data. We believe that our generic framework could be a game-changer for autonomous driving systems and CCTV stuff!


## 🤔 **Getting Started**
### ✅ **Requirements**
- This codebase is written for `python3` (used `python 3.7.6` while implementing).
- To install necessary python packages, run `pip install -r requirements.txt`.

## 🚗 **Dataset**

### 💻 **1. Download** 
#### **BDD100K** [[Link](https://paperswithcode.com/dataset/bdd100k)]
- **Description**: The BDD100K dataset features 100,000 driving videos from various U.S. locations, covering diverse weather conditions.
- **Utilization**: We selected 20,000 data points from this dataset, focusing on cloudy, rainy, overcast, and snowy conditions. 
- **Purpose**: This setup helps in investigating the impact of data heterogeneity on our framework and assessing its robustness in realistic conditions.
- **Download**: `bash ./data/download/download_bdd.sh`

#### **SODA10M** [[Link](https://soda-2d.github.io/)]
- **Description**: The SODA10M dataset offers a diverse range of geographies, weather conditions, and object categories.
- **Utilization**: In an IID setup, 20,000 labeled data points are distributed among one server and three clients. For a more realistic setup, these labeled data are kept on the server, while 100,000 unlabeled data points are distributed across the clients.
- **Purpose**: This configuration allows for performance evaluation under varying weather conditions like clear, overcast, and rainy, demonstrating the resilience and robustness of our approach.
- **Download**: `bash ./data/download/download_soda10m.sh`

### 🏭 **2. Setup FL Environment** 

Our setup scripts are designed to prepare the datasets and training environment for various configurations of federated learning and semi-supervised learning. Here's a breakdown of what each script does:

#### **Centralized Training**
- `setup_bdd_centralized.sh` & `setup_soda_centralized.sh`
  - **Description**: These scripts configure the environment for centralized training where all data is stored in a single data source.
  - **Usage**: Employ these scripts when you intend to train your model in a fully supervised manner with all available labeled data.

#### **Semi-Supervised Learning (SSL)**
- `setup_{dataset}_1ds_ssl_{iid/non-iid}.sh`
  - **Description**: For semi-supervised learning scenarios, these scripts set up a single data source on the server with both labeled and unlabeled data.
  - **Variants**:
    - **IID**: `setup_bdd_1ds_ssl_iid.sh` & `setup_soda_1ds_ssl_iid.sh` for setups where the data distribution is independent and identically distributed (IID) across labeled and unlabeled data.
    - **Non-IID**: `setup_bdd_1ds_ssl_noniid.sh` & `setup_soda_1ds_ssl_noniid.sh` for setups where there is heterogeneity in weather conditions between labeled and unlabeled data.

#### **Semi-Supervised Federated Learning**
- `setup_bdd_{4ds/100ds}_ssfl_noniid.sh`
  - **Description**: These scripts are tailored for federated learning with a semi-supervised approach, dealing with non-IID data (Weather Condition Heterogeneity) across multiple data sources.
  - **Usage**: Use these for simulating a federated learning environment with data heterogeneity.

#### **Data Source Specific Scripts**
- `setup_bdd_ssfl_iid_{4/100}datasources.sh`
  - **Description**: Scripts specific to the BDD100K dataset that configure SSFL training across multiple IID data sources.
  - **Usage**: Choose based on the number of data sources (4 or 100) you wish to simulate.

#### **Etc: Percentages for Labeled Dataset**
- `setup_bdd_ssl_{iid/non-iid}_20perc.sh`
  - **Description**: 20perc means the percentages for the use of labeled datasets. You can freely control this percentage in the bash file.
  - **Usage**: Select IID for homogeneous and Non-IID for heterogeneous weather conditions across labeled data.

Our scripts are named following the convention: `setup_{dataset name}_{# of data sources}_{algorithm}_{iid or non-iid}.sh` for clarity and ease of use. For more detailed instructions on how to use each script, please refer to the individual script headers.


## 💡 **Code Implementation**
- Still in progress. To be uploaded!! 🏃🏻🏃🏻🏃🏻

## 😎 **Personal Note**

![Image](./img.png)

