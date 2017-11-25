# Use base maven-jdk  standard image
FROM maven:3.5.2-jdk-3.5.2-jdk-8 

# Install google chrome latest stable release

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
    && sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update -qqy \ 
    && apt-get -qqy install google-chrome-stable \ 
    && rm /etc/apt/sources.list.d/google-chrome.list \ 
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \ 
    && sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome


# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
# 	&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \ && apt-get update -qqy \ && apt-get -qqy install google-chrome-stable \ && rm /etc/apt/sources.list.d/google-chrome.list \ && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \ && sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome 


#To run headless browser
RUN apt-get update -qqy \ && apt-get -qqy install xvfb \ && rm -rf /var/lib/apt/lists/* /var/cache/apt/*