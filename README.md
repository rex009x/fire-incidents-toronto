# Toronto's Fire Incidents and Contributing Factors: An Explorative Analysis

## Overview

This paper uses publicly available data from [Toronto Open Data](https://open.toronto.ca/) to identify contributing factors to fire incidents and their resulting financial losses. Further analysis of Toronto Fire Services' response time, area of origin, and various fire prevention measures as considering factors in the estimation. The results reveal a positive correlation between estimated dollar loss and possible causes of the incident, namely, mechanical/electrical failures yielding the highest loss. These findings bring urgency to fire safety as they highlight the importance of proper education, maintenance, and safety inspections. This analysis encourages homeowners, businesses, and property managers to take initiative in order to ensure the well-being of others.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from [Toronto Open Data's fire incidents dataset](https://open.toronto.ca/dataset/fire-incidents/).
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions, respective datasheet and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean and test data.


## Statement on LLM usage

Aspects of the code and introduction were written with the help of ChatGPT. The entire chat history is available in `other/llm/usage.txt`.
