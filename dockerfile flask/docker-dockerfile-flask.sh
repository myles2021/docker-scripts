mkdir myapp && cd $_
touch app.py

printf "@app.route('/home')\n@app.route('/')\ndef home():\n    return \"Hello world!\"\n\nif __name__ == '__main__':\n    app.run(port=5000, host='0.0.0.0', debug=True)"

touch Dockerfile

printf "# Python base image.\nFROM python:3.7\n# Create and set the work directory inside the image named 'app'\nWORKDIR /app\n# Execute a pip install command using the list 'requirements.txt'\nRUN pip install Flask\n# Copy the app file into the image working directory\nCOPY app.py .\n# State the listening port for the container. \nEXPOSE 5000\n# Run 'python app.py' on container start-up. This is the main process.\nENTRYPOINT [\"python\", \"app.py\"]"

docker build -t myapp .
docker run -d -p 5000:5000 --name myapp myapp
curl ifconfig.me
curl localhost:5000
# docker stop myapp
# docker rm myapp
# docker rmi myapp
