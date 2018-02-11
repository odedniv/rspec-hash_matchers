RSpec.describe RSpec::HashMatchers::ContainExactlyKeys do
  describe "#contain_exactly_keys" do
    subject { { a: 1, b: 2, c: 3, d: 4 } }

    context "Match" do
      context "Only hash" do
        it { should contain_exactly_keys(b: 2, c: 3, a: 1, d: 4) }
      end

      context "Only keys" do
        it { should contain_exactly_keys(:b, :c, :a, :d) }
      end

      context "Keys and hash" do
        it { should contain_exactly_keys(:d, :b, c: 3, a: 1) }
      end
    end

    context "Mismatch" do
      context "Only hash" do
        context "Wrong value" do
          it { should_not contain_exactly_keys(a: 1, b: 2, c: 5, d: 4) }
        end

        context "Missing" do
          it { should_not contain_exactly_keys(a: 1, b: 2, d: 4) }
        end

        context "Extra" do
          it { should_not contain_exactly_keys(a: 1, b: 2, d: 4, e: 5) }
        end

        context "Missing and extra" do
          it { should_not contain_exactly_keys(a: 1, b: 2, c: 3, d: 4, e: 5) }
        end
      end

      context "Only Array" do
        context "Missing" do
          it { should_not contain_exactly_keys(:a, :b, :d) }
        end

        context "Extra" do
          it { should_not contain_exactly_keys(:a, :b, :d, :e) }
        end

        context "Missing and extra" do
          it { should_not contain_exactly_keys(:a, :b, :c, :d, :e) }
        end
      end

      context "Hash and array" do
        context "Wrong value" do
          it { should_not contain_exactly_keys(:a, :b, c: 5, d: 4) }
        end

        context "Missing" do
          it { should_not contain_exactly_keys(:a, :b, d: 4) }
        end

        context "Extra" do
          it { should_not contain_exactly_keys(:a, :b, :c, d: 4, e: 5) }
        end

        context "Missing and extra" do
          it { should_not contain_exactly_keys(:a, :b, d: 4, e: 5) }
        end
      end
    end
  end

  describe "#contain_exactly_keys_in_array" do
    subject do
      [
        { a: 1, b: 2, c: 3 },
        { d: 4, e: 5, f: 6 },
        { g: 7, h: 8, i: 9 },
      ]
    end

    context "Match" do
      it do
        should contain_exactly_keys_in_array(
          [:e, :d, :f],
          { h: 8, g: 7, i: 9 },
          [:c, b: 2, a: 1],
        )
      end
    end

    context "Mismatch" do
      context "Missing row" do
        it do
          should_not contain_exactly_keys_in_array(
            [:e, :d, :f],
            { h: 8, g: 7, i: 9 },
            [:c, b: 2, a: 1],
            [:j, :k],
          )
        end
      end

      context "Extra row" do
        it do
          should_not contain_exactly_keys_in_array(
            [:e, :d, :f],
            [:c, b: 2, a: 1],
          )
        end
      end

      context "Missing and extra" do
        it do
          should_not contain_exactly_keys_in_array(
            { h: 8, g: 7, i: 9 },
            [:c, b: 2, a: 1],
            [:j, k: 10],
          )
        end
      end
    end
  end
end
