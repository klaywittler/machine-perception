function tests = test_gaussian1d
  tests = functiontests(localfunctions);
end


function test_sanity(testCase)
  len = [5,6];
  sigma = [1,2];
  for l=len
    for s=sigma
      g = gaussian1d(s, l);
      verifyEqual(testCase, length(g), l, ...
                  'Incorrect length.');
      verifyEqual(testCase, size(g, 1), 1, ...
                  'Output must be a row vector.');
      verifyEqual(testCase, sum(g), 1, ...
                  'AbsTol', testCase.TestData.EPS, ...
                  'Filter values must sum to one.');
      for i=1:l
        verifyEqual(testCase, g(i), g(l-i+1), ...
                    'AbsTol', testCase.TestData.EPS, ...
                    'Filter must be symmetric.');
      end
    end
  end
end

function setupOnce(testCase)
  testCase.TestData.EPS = 1e-6;
end
