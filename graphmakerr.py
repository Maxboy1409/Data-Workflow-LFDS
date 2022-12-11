import matplotlib.pyplot as plt
import pandas as pd

# Read the CSV file into a pandas DataFrame
df = pd.read_csv('dataBikes.csv')

# Create a bar chart
df.plot(kind='bar')

# Add a title, x-axis label, and y-axis label
plt.title('Blue Bikes St. Denijslaan')
plt.xlabel('Tijd')
plt.ylabel('Aantal fietsen')

plt.xticks(rotation=360)

# Show the plot
plt.show()