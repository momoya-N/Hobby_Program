using Plots

Base.@kwdef struct Setting
    depth::Int = 8
    x::Float64 = 0
    y::Float64 = 0
    length::Float64 = 20
    angle::Float64 = π / 2
    rbr::Float64 = 0.6
    lbr::Float64 = 0.6
    right_angle::Float64 = π / 6
    left_angle::Float64 = π / 6
end

function draw_tree(x, y, angle, length, depth)
    if depth == 0
        return
    end

    x2 = x + length * cos(angle)
    y2 = y + length * sin(angle)

    plot!([x, x2], [y, y2], color=:green)

    draw_tree(x2, y2, angle - π / 4, length * 0.7, depth - 1)
    draw_tree(x2, y2, angle + π / 4, length * 0.7, depth - 1)
end

function fractal_tree(x, y, length, depth)
    plot()
    draw_tree(x, y, -π / 2, length, depth)
    plot!(legend=false)
    savefig("/mnt/c/Users/PC/Desktop/Hobby_Program/2D_Fractal_Tree/fractal_tree.png")
end

s = Setting()
fractal_tree(s.x, s.y, s.length, s.depth)