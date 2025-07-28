from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
import pandas as pd
options = Options()
options.add_argument("--headless")  
options.add_argument("--disable-gpu")
options.add_argument("--no-sandbox")

driver = webdriver.Chrome(options=options)
url = "https://www.espncricinfo.com/series/ipl-2021-1249214/match-1/rcb-vs-mi-live-cricket-score"
driver.get(url)
time.sleep(5)  
commentary_divs = driver.find_elements(By.CSS_SELECTOR, '.live-comm')

commentary_data = []
for comm in commentary_divs:
    ball = comm.find_element(By.CSS_SELECTOR, '.ball').text.strip()
    description = comm.find_element(By.CSS_SELECTOR, '.description').text.strip()
    commentary_data.append([ball, description])
driver.quit()
df = pd.DataFrame(commentary_data, columns=["Ball", "Description"])
print(df.head())

df.to_csv("ball_by_ball_commentary.csv", index=False)
print(" Ball-by-ball commentary saved to 'ball_by_ball_commentary.csv'")
