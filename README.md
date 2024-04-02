# Evaluating Toronto's Fire Incidents to Extrapolate Future Occurrence Data

## Overview

This paper utilizes publically available data from [Toronto Open Data](https://open.toronto.ca/) to predict the estimated dollar loss per fire incident in the Toronto area by property use. Further analysis of Toronto Fire Services' response time, area of origin, and various fire prevention measures as considering factors in the estimation. The results reveal a positive correlation between estimated dollar loss and possible causes of the incident, namely, mechanical/electrical failures yielding the highest loss. These findings bring urgency to fire safety as they highlight the importance of proper education, maintenance, and safety inspections. This analysis encourages homeowners, businesses, and property managers to take initiative in order to ensure the well-being of others.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from [Toronto's Open Data fire incidents data](https://open.toronto.ca/dataset/fire-incidents/).
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. The abstract, introduction, and discussion sections were written using ChatGPT. The entire chat history is available in `other/llm/usage.txt`.
