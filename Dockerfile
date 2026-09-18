FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /home/jupyteruser/app

# Instalar dependencias como root para registrar 'jupyter' en /usr/local/bin
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Crear el usuario no-root y asignarle la carpeta de trabajo
RUN useradd -m jupyteruser && \
    chown -R jupyteruser:jupyteruser /home/jupyteruser

USER jupyteruser

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''"]