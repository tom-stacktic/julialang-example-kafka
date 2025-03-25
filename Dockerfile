FROM julia:1.10

# Install dependencies
WORKDIR /app
COPY Project.toml .
RUN julia -e 'using Pkg; Pkg.instantiate()'

# Copy source
COPY . .

# Run main script
CMD ["julia", "src/main.jl"]
