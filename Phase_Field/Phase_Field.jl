using LinearAlgebra

function phase_field_method(nx, ny, dx, dy, dt, num_steps)
    # Initialize the phase field variable
    phi = zeros(nx, ny)

    # Main time loop
    for step in 1:num_steps
        # Compute Laplacian of phi
        laplacian_phi = laplacian(phi, dx, dy)

        # Update phi using the Allen-Cahn equation
        phi += dt * (laplacian_phi - phi .^ 3 + phi)

        # Apply boundary conditions
        apply_boundary_conditions(phi)

        # Print the current step and the maximum value of phi
        println("Step $step: Max phi = $(maximum(phi))")
    end
end

function laplacian(phi, dx, dy)
    nx, ny = size(phi)
    laplacian_phi = zeros(nx, ny)

    for i in 2:nx-1, j in 2:ny-1
        laplacian_phi[i, j] = (phi[i+1, j] + phi[i-1, j] + phi[i, j+1] + phi[i, j-1] - 4 * phi[i, j]) / (dx^2 + dy^2)
    end

    return laplacian_phi
end

function apply_boundary_conditions(phi)
    nx, ny = size(phi)

    # Dirichlet boundary conditions
    phi[1, :] = 1.0
    phi[nx, :] = 0.0
    phi[:, 1] = 0.0
    phi[:, ny] = 0.0
end

# Parameters
nx = 100  # Number of grid points in x-direction
ny = 100  # Number of grid points in y-direction
dx = 1.0  # Grid spacing in x-direction
dy = 1.0  # Grid spacing in y-direction
dt = 0.01 # Time step size
num_steps = 1000  # Number of time steps

# Run the phase field method
phase_field_method(nx, ny, dx, dy, dt, num_steps)