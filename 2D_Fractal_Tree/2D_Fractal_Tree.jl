using Plots

Base.@kwdef struct Setting
    depth::Int = 10
    init_branch::Int = 4
    x::Float64 = 0
    y::Float64 = 0
    length::Float64 = 20
    angle::Float64 = π / 6
    rbr::Float64 = 0.6
    lbr::Float64 = 0.6
    right_angle::Float64 = 2π / 3
    left_angle::Float64 = 2π / 3
end

function draw_tree(x, y, angle, length, depth)
    if depth == 0
        return
    end

    x2 = x + length * cos(angle)
    y2 = y + length * sin(angle)

    plot!([x, x2], [y, y2], color=:green)

    draw_tree(x2, y2, angle - s.angle, length * 0.7, depth - 1)
    draw_tree(x2, y2, angle + s.angle, length * 0.7, depth - 1)
end

function fractal_tree(x, y, length, depth)
    plot()
    # for i in 0:s.init_branch-1
    #     draw_tree(x, y, i * 2π / s.init_branch, length, depth)
    # end
    draw_tree(x, y, 0, length, depth)
    draw_tree(x, y, 2π / 3, length, depth)
    draw_tree(x, y, 4π / 3, length, depth)
    plot!(legend=false)
    savefig("/mnt/c/Users/PC/Desktop/Hobby_Program/2D_Fractal_Tree/fractal_tree.png")
end

s = Setting()
@time fractal_tree(s.x, s.y, s.length, s.depth)