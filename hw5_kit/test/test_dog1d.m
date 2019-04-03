function tests = test_dog1d
  tests = functiontests(localfunctions);
end


function test_sanity(testCase)
  len = [7, 8];
  sigma = [1, 2];
  ks = [1.5, 2];
  for l=len
    for s=sigma
      for k=ks
        g = dog1d(s, k, l);
        verifyEqual(testCase, length(g), l, ...
                    'Incorrect length.');
        verifyEqual(testCase, size(g, 1), 1, ...
                    'Output should be a row vector.');
        verifyEqual(testCase, sum(g), 0, ...
                    'AbsTol', testCase.TestData.EPS, ...
                    'Filter values must sum to zero.');
        for i=1:l
          verifyEqual(testCase, g(i), g(l-i+1), ...
                      'AbsTol', testCase.TestData.EPS, ...
                      'Filter must be symmetric.');
        end
      end
    end
  end
end

function setupOnce(testCase)
  testCase.TestData.EPS = 1e-6;
end
