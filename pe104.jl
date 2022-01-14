### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 2fbad4b0-4a04-11eb-0e95-d5cf75ab77f1
function fib(n)
	if n ∈ [1, 2]
		return 1
	end
	n1::BigInt = 1
	n2::BigInt = 1
	for i = 3:n
		n2, n1 = n1 + n2, n2
	end
	return n2
end

# ╔═╡ 0b1c94a0-49db-11eb-2aaa-1f451855bf52
function findfib(nmax)
	n1::BigInt = 1
	n2::BigInt = 1
	for i = 3:nmax
		n2, n1 = n1 + n2, n2
		nl = [parse(Int, x) for x in string(n2)]
		if length(nl) > 17
			if (Set(nl[1:9]) == Set(1:9)) & (Set(nl[end-8:end]) == Set(1:9))
				return i
			end
		end
	end
	return 0
end

# ╔═╡ 6381aee0-4a04-11eb-3f82-71e72b4eb0ea
findfib(500000)

# ╔═╡ Cell order:
# ╠═2fbad4b0-4a04-11eb-0e95-d5cf75ab77f1
# ╠═0b1c94a0-49db-11eb-2aaa-1f451855bf52
# ╠═6381aee0-4a04-11eb-3f82-71e72b4eb0ea
