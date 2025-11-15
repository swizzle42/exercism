module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )


type Complex
    = Complex Float Float


fromPair : ( Float, Float ) -> Complex
fromPair pair =
    case pair of
        (a, b) ->
            Complex a b


fromReal : Float -> Complex
fromReal float =
    Complex float 0.0


real : Complex -> Float
real z =
    case z of
        Complex a b ->
            a


imaginary : Complex -> Float
imaginary z =
    case z of
        Complex a b ->
            b


conjugate : Complex -> Complex
conjugate z =
    case z of
        Complex a b ->
            Complex a -b


abs : Complex -> Float
abs z =
    case z of
        Complex a b ->
            sqrt (a^2 + b^2)


add : Complex -> Complex -> Complex
add z1 z2 =
    case (z1, z2) of
        (Complex a b, Complex c d) ->
            Complex (a + c) (b + d)
            

sub : Complex -> Complex -> Complex
sub z1 z2 =
    case (z1, z2) of
        (Complex a b, Complex c d) ->
            Complex (a - c) (b - d)


mul : Complex -> Complex -> Complex
mul z1 z2 =
    case (z1, z2) of
        (Complex a b, Complex c d) ->
            Complex (a * c - b * d) (b * c + a * d)


div : Complex -> Complex -> Complex
div z1 z2 =
    case (z1, z2) of
        (Complex a b, Complex c d) ->
            let
                new_a = (a * c + b * d) / (c^2 + d^2)
                new_b = (b * c - a * d) / (c^2 + d^2)
            in
            Complex new_a new_b


exp : Complex -> Complex
exp z =
    case z of
        Complex a b ->
            Complex (e^a * cos b) (e^a * sin b)
