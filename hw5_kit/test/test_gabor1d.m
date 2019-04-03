function tests = test_gabor1d
  tests = functiontests(localfunctions);
end


function test_sanity(testCase)
  sigma = [10,20];
  T = [20,30];
  for t=T
    for s=sigma
      [c, s] = gaborFilter1D(t, s, 3*t);
      verifyEqual(testCase, length(c), length(s), ...
                  'Both parts must have same length');
      verifyEqual(testCase, length(c), 3*t, ...
                  'Incorrect length.');
      verifyEqual(testCase, size(c, 1), 1, ...
                  'Output must be a row vector.');
      verifyEqual(testCase, sum(sqrt(s.^2 + c.^2)), 1, ...
                  'AbsTol', testCase.TestData.EPS, ...
                  'Bad normalization.');
    end
  end
end

function setupOnce(testCase)
  testCase.TestData.EPS = 1e-6;
end
